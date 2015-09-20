# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# project_client_id - id of select we want...\

$ ->
  $(document).on 'change', '#project_client_id', (evt) ->
    $.ajax
      url: 'update_contacts'
      type: 'GET'
      dataType: 'script'
      data: {
        client_id: $("#project_client_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic contact select OK!")