# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.datepicker').datepicker({
     startDate: '+0d'
     maxViewMode: 0
     format: 'yyyy/MM/dd'
     changeDate: (date) ->
  }).on 'changeDate', (date) ->
    $('#goal_end_date').val date.date
