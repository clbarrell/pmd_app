# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Enable & disable sales percentage as required
$ ->
  $(document).on 'focus', '#project_split_role_sales', (evt) ->
    $('#project_split_percentage').prop('disabled',false)
$ ->
  $(document).on 'focus', '#project_split_role_coordinator', (evt) ->
    $('#project_split_percentage').prop('disabled',true)
$ ->
  $(document).on 'focus', '#project_split_role_involved', (evt) ->
    $('#project_split_percentage').prop('disabled',true)
