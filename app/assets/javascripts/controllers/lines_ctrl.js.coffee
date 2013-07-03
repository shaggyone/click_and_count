@LinesCtrl = ($scope, Line) ->
  $scope.log_data = []
  $scope.pluralize = window.pluralize

  $scope.send_line = (line) ->
    Line.save line: line, (res) ->
      $scope.log_data.push res.timestamp
      $scope.queries_number = res.queries_number

      $scope.line = null


