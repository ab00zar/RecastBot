@Message = React.createClass
  text_reply: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.div
          className: 'question'
          @props.message.question
        React.DOM.div
          className: 'answer'
          @props.message.answer
  photo_reply: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.div
          className: 'question'
          @props.message.question
        React.DOM.img
          className: 'answer'
          src: @props.message.answer
  render: ->
    if (@props.message.reply_type == 'text')
      @text_reply()
    else
      @photo_reply()