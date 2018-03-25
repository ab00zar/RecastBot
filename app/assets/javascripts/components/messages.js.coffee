@Messages = React.createClass
    getInitialState: ->
        messages: @props.data
    getDefaultProps: ->
        messages: []
    addMessage: (message) ->
      messages = @state.messages.slice()
      messages.push message
      @setState messages: messages
      this.forceUpdate()
    render: ->
      React.DOM.table
        className: 'table borderless'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Welcome to Iran bot'
        React.DOM.tbody null,
          for message in @state.messages
            React.createElement Message, key: message.id, message:message
          React.DOM.tr null,
            React.DOM.td null,
              React.createElement MessageForm, handleNewMessage: @addMessage
