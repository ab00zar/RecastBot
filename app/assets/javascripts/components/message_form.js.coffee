@MessageForm = React.createClass
  getInitialState: ->
    question: ''
    answer: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    @state.question
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {message: @state}, (data) =>
      @props.handleNewMessage data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          placeholder: 'type a message ...'
          className: 'form-control input-message'
          name: 'question'
          value: @state.question
          onChange: @handleValueChange
