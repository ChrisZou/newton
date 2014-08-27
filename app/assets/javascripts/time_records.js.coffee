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
            date = new Date()
            day = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()
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

