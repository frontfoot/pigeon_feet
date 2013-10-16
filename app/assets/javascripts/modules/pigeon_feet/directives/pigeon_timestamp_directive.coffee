Blah = ($timeout) ->

  scope: {}

  compile: ->
    ($scope, $elem, $attrs) ->
      @details = $scope.time_tracker_output = $attrs.timeTracker.toString()

      updateTimestamp = =>
        $elem.addClass('highlighted') if @details <= 300000 # 5 mins
        (@details -= 1000); $timeout(updateTimestamp, 1000)

      updateTimestamp() if @details.match /^\d+$/

@PigeonFeet.directive 'timeTracker', ['$timeout', Blah]
