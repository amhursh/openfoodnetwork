angular.module("admin.users").directive "ofnUserAutocomplete", ($http) ->
  link: (scope,element,attrs) ->
    setTimeout ->
      element.select2
        multiple: false
        initSelection: (element, callback) ->
          callback { id: element.val(), email: attrs.email }
        ajax:
          url: '/admin/search/known_users'
          datatype: 'json'
          data:(term, page) ->
            { q: term }
          results: (data, page) ->
            { results: data }
        formatResult: (user) ->
          user.email
        formatSelection: (user) ->
          user.email
