// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
  $(".answer_question").on("click", function(event) {
    event.preventDefault();
    var id = parseInt($(event.currentTarget).attr("data-id"));
    var answerForm = JST["templates/answer_form"]({ id: id });
    $("#question_box" + id).html(answerForm);

    $(".hide_answer_form").on("click", function(event) {
      event.preventDefault();
      $("#question_box" + id).html("");
    });

    $(".answer_form_submit").on("click", function() {
      var id = parseInt($(event.currentTarget).attr("data-id"));
      var answer = {answer: {text: $("#answer_form" + id).val()}}
      $.ajax({
        url: "/questions/" + id + "/answers.json",
        type: "post",
        data: answer,
        success: function(answerData) {
          $("#answer_list" + id).append($("<li></li>").html(answerData.text));
          $(".answer_form_submit").unbind("click");
          $("#question_box" + id).html("");
        }
      });
    });
  });
  $(".new_question_link").on("click", function() {
    event.preventDefault();
    $.ajax({
      url: "/topics.json",
      type: "get",
      success: function(topicsData) {
        setUpQuestionForm(topicsData);
      }
    });
  });
});

function setUpQuestionForm(topics) {
  var questionForm = JST["templates/question_form"]({ topics: topics });
  $(".question").html(questionForm);

  $(".hide_question_form").on("click", function() {
    event.preventDefault();
    console.log("clicked da link");
     $(".question").html("");
  });
  $(".question_form_submit").on("click", function(event) {
    var question = {question: {title: $(".question_body").val()}}
    $.ajax({
      url: "/questions.json",
      type: "post",
      data: question,
      success: function(questionData) {
        console.log("made a question");
        $(".question").html("");
      }
    });
  });
}

