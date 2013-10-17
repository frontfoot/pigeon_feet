Blah = ($timeout) ->

  scope: {}

  compile: ->
    ($scope, $elem, $attrs) ->
      @details = $scope.time_tracker_output = $attrs.timeTracker.toString()

      isRaceSoon = =>
        ref = (@details - Date.now())
        ref <= 300000 && ref >= 0

      updateTimestamp = =>
        $elem.addClass('highlighted') if isRaceSoon()
        (@details -= 1000); $timeout(updateTimestamp, 1000)

      updateTimestamp() if @details.match /^\d+$/

@PigeonFeet.directive 'timeTracker', ['$timeout', Blah]
