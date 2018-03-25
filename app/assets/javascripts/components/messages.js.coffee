@Messages = React.createClass
    getInitialState: ->
        messages: @props.data
    getDefaultProps: ->
        messages: []
    render: ->
      React.DOM.table
        className: 'table borderless'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Welcome to Recast.io Iran bot!'
        React.DOM.tbody null,
          for message in @state.messages
            React.createElement Message, key: message.id, message:message
