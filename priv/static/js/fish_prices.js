(function(Phoenix) {
    var socket = new Phoenix.Socket('/socket');
    socket.connect();

    var channel = socket.channel('fish_prices:lobby', {});
    channel.join()
        .receive('ok', res => console.log('Response:OK ' +  JSON.stringify(res)))
        .receive('error', res => console.log('Error: ' + JSON.stringify(res)));

    channel.on('quotation', res => {
        console.log('Updated Price: ' + JSON.stringify(res));
    })
})(window.Phoenix);
