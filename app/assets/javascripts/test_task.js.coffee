@app = angular.module("TestTask", [ "ngResource" ])

@app.config ["$httpProvider", ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

@app.factory 'Line', ($resource) ->
  $resource "/lines/", {},
    create:  { method: 'POST',   isArray: false }


