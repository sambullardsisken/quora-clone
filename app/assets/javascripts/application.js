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
//= require bootstrap
//= require_tree .

$(function(){
  $(".delete_answer").on("click", function(event) {
    event.preventDefault();
    var answerId = $(this).attr("data-id");
    deleteAnswer(answerId);
  });

  $(".answer_question").on("click", function(event) {
    event.preventDefault();
    toggleMessage(this, "Add Answer", "Cancel");
    var id = parseInt($(event.currentTarget).attr("data-id"));
    if ($("#question_box" + id).html() === "") {
      var answerForm = JST["templates/answer_form"]({ id: id });
      $("#question_box" + id).html(answerForm);
    }
    else {
      $("#question_box" + id).html("");
    }

    $(".answer_form_submit").on("click", function() {
      var id = parseInt($(event.currentTarget).attr("data-id"));
      var answer = {answer: {text: $("#answer_form" + id).val()}}
      $.ajax({
        url: "/questions/" + id + "/answers.json",
        type: "post",
        data: answer,
        success: function(answerData) {
          var answerView = JST["templates/answer_view"]({answer: answerData})
          console.log(answerData.id)
          var newListItem = $("<li></li>")
          $(newListItem).attr('id', "answer_listing" + answerData.id);
          newListItem.html(answerView);
          $("#answer_list" + id).append(newListItem);

          $(".answer_form_submit").unbind("click");
          $("#question_box" + id).html("");
          $("#answer_question" + id).html("Add Answer");
          $(".delete_answer").on("click", function(event) {
            console.log("click")
            console.log(this)
            event.preventDefault();
            var answerId = $(this).attr("data-id");
            console.log(answerId)
            console.log($("#answer_listing" + answerId).html())
            deleteAnswer(answerId);
          });
        }
      });
    });
  });
  $(".new_question_link").on("click", function() {
    event.preventDefault();
    toggleMessage(this, "Ask a Question", "Cancel");
    $.ajax({
      url: "/topics.json",
      type: "get",
      success: function(topicsData) {
        setUpQuestionForm(topicsData);
      }
    });
  });
  $(".show_topics").on("click", function(event) {
    event.preventDefault();
    toggleMessage(this, "View Topics", "Close");
    var subjectId = parseInt($(this).attr("data-id"))
    $.ajax({
      url: "/subjects/" + subjectId + "/topics.json",
      type: "get",
      success: function(topicsData) {
        showTopicList(topicsData, subjectId)
      }
    });
  });
  $(".post_comment").on("click", function(event) {
    event.preventDefault();
    toggleMessage(this, "comment", "cancel");
    var id = parseInt($(this).attr("data-id"));
    if ($("#comment_field" + id).html() === "") {
      var commentForm = JST["templates/comment_form"]({ id: id});
      $("#comment_field" + id).html(commentForm)
    }
    else {
      $("#comment_field" + id).html("");
    }

    $(".comment_form_submit").on("click", function() {
      var comment = {comment: {text: $("#comment_form" + id).val(), answer_id: id}}
      $.ajax({
        url: "/comments.json",
        type: "post",
        data: comment,
        success: function(commentData) {
          $("#comment_field" + id).html("");
          $("#post_comment" + id).html("comment");
          var newCount = parseInt($("#count" + id).html()) + 1;
          var newMessage = newCount === 1 ? "comment" : "comments";
          $("#count" + id).html(newCount);
          $("#comments_text" + id).html(newMessage);
        }
      });
    });
  });
  $(".comment_count").on("click", function(event) {
    event.preventDefault();
    var answerId = parseInt($(this).attr("data-id"));
    $.ajax({
      url: "/answers/" + answerId + "/comments.json",
      type: "get",
      success: function(commentsData) {
        if ($("#comments_container" + answerId).html() === "") {
          commentsList = JST["templates/comments"]({ comments: commentsData})
          $("#comments_container" + answerId).html(commentsList);
        }
        else {
          $("#comments_container" + answerId).html("");
        }
      }
    })
  });
  $(".up_vote").on("click", function(event) {
    var that = this;
    event.preventDefault();
    var answerId = parseInt($(this).attr("data-id"));
    console.log(answerId)
    $.ajax({
      url: "/answer_votes.json",
      type: "post",
      data: {answer_vote: {answer_id: answerId}},
      success: function() {
        var newCount = parseInt($("#vote_count" + answerId).html()) + 1
        var text = newCount == 1 ? " vote" : " votes"
        $("#vote_count" + answerId).html(newCount + text);
         $("#vote_text" + answerId).html("upvoted");
      }
    });
  });
  $(".down_vote").on("click", function(event) {
    var that = this;
    event.preventDefault();
    var answerId = parseInt($(this).attr("data-id"));
    console.log(answerId)
    $.ajax({
      url: "/answer_down_votes.json",
      type: "post",
      data: {answer_down_vote: {answer_id: answerId}},
      success: function() {
        var newCount = parseInt($("#vote_count" + answerId).html()) - 1
        var text = newCount == 1 ? " vote" : " votes"
        $("#vote_count" + answerId).html(newCount + text);
        $("#vote_text" + answerId).html("downvoted");
      }
    });
  });
  $(".follow_question").on("click", function(event) {
    console.log($(this).html())
    if ($(this).html() === "Unfollow") {
      unfollowQuestion($(this).attr("data-id"), this)
    }
    else {
      followQuestion($(this).attr("data-id"), this)
    }
  });
  $(".trending_view").on("click", function(event) {
    event.preventDefault();
    getTrendingTopics();
  });
});

function toggleMessage(context, firstMessage, secondMessage) {
  if (context.text === firstMessage) {
    $(context).text(secondMessage);
  }
  else {
    $(context).text(firstMessage);
  }
}

function getFeed() {
  $.ajax({
    url: "/questions/feed.json",
    type: "get",
    success: function(feedData) {
      feedView = JST["templates/question_index"]({ questions: feedData })
      $(".feed_questions").html(feedView);
    }
  });
}

function getTrendingTopics() {
  $.ajax({
    url: "/topics/trending.json",
    type: "get",
    success: function(topicsData) {
      console.log(topicsData)
      trendingView = JST["templates/trending"]({ topics: topicsData})
     $(".trending").html(trendingView);
    }
  });
}

function determineClass(obj) {
  if (obj.question_id !== undefined) {
    return "Answer";
  }
  else if (obj.answer_id !== undefined) {
    return "Comment";
  }
  else {
    return "Question";
  }
}

function parseTime(millisecs, dateObj) {
  if (millisecs < 1000 * 60) {
    return "< 1 min ago";
  }
  else if (millisecs < 1000 * 60 * 60) {
    return parseInt(millisecs / (1000 * 60)) + " min ago";
  }
  else if (millisecs < 1000 * 60 * 60 * 24) {
    return parseInt(millisecs / (1000 * 60 * 60)) + " hr ago";
  }
  else {
    return getTimeStamp(dateObj)
  }
}

function getTimeStamp(obj) {
  return new Date(obj).toLocaleString("en-US", {timeZone: "America/Los_Angeles"})
}

function followQuestion(questionId, context) {
  $.ajax({
    url: "/question_followings.json",
    type: "post",
    data: {question_following: {question_id: questionId}},
    success: function(questionFollowingData) {
      console.log("following")
      toggleMessage(context, "Follow", "Unfollow");
    }
  });
}

function unfollowQuestion(questionId, context) {
  $.ajax({
    url: "/question_followings/" + questionId + ".json",
    type: "delete",
    success: function() {
      console.log("unfollowing")
      toggleMessage(context, "Follow", "Unfollow");
    }
  });
}

function deleteAnswer(answerId) {
  $.ajax({
    url: "/answers/" + answerId + ".json",
    type: "delete",
    success: function() {
      console.log("DELETE")

      $("#answer_listing" + answerId).remove();
    }
  });
}

function showTopicList(topics, id) {
  if ($("#topic_list" + id).html() === "") {
    var topicList = JST["templates/topic_index"]({topics: topics});
    $("#topic_list" + id).html(topicList);
  }
  else {
    $("#topic_list" + id).html("");
  }
}

function setUpQuestionForm(topics) {
  if ($(".question").html() === "") {
    var questionForm = JST["templates/question_form"]({});
    $(".question").html(questionForm);
  }
  else {
    $(".question").html("");
  }

  $(".add_tag").on("click", function() {
    event.preventDefault();
    var selectTopic = JST["templates/topic_select"]({ topics: topics })
    $(".select_area").append(selectTopic);
  });


  $(".question_form_submit").on("click", function(event) {
    event.preventDefault();
    var topicIds = []
    $(".topic_select").each(function() {
      topicIds.push(parseInt($(this).val()));
    });


    var question = {question: {topic_ids: topicIds, title: $(".question_title").val(), body: $(".question_body").val()}}
    $.ajax({
      url: "/questions.json",
      type: "post",
      data: question,
      success: function(questionData) {
        console.log("made a question");
        $(".question").html("");
        $(".new_question_link").html("Ask a question");
      }
    });
  });
}

