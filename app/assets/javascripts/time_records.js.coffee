# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready -> 
    $(".record_textfield").on 'keypress', (e) ->
        if e.keyCode==13
            id = $(this).attr('id')
            hq = id.split('-')
            hour = parseInt(hq[0])
            quarter = parseInt(hq[1])
            day = $("#date").val()
            event = $(this).val()
            $.ajax({
                type: "POST",
                url: "/time_records",
                dataType: "script"
                data: { time_record: {day: day, hour: hour, quarter: quarter, event: event} },
                success:(data) ->
                    console.log("data:"+data+":end")
                    #$("#msg").text("time record created")
                    return false
                error:(data) ->
                    console.log("failed")
                    return false
            })
    $("#date").on 'change', (e) ->
        date = $(this).val()
        if date.length ==0
            return

        dates = date.split('/')
        year = dates[2]
        month = dates[0]
        day = dates[1]
        date_str = year+'-'+month+'-'+day
        window.location.replace('/time_records?day='+date_str)
        if false 
            $.ajax({
                type: 'GET',
                url: '/time_records'
                dataType: 'script'
                data: {day: year+'-'+month+'-'+day}
                success: (data) ->
                    console.log("date: "+data+":end")
                    return false
                error: (data) ->
                    console.log("Failed: "+data)
                    return false
            })
