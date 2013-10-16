Blah = ($timeout) ->

  scope: {}

  compile: ->
    ($scope, $elem, $attrs) ->
      @details = $scope.time_tracker_output = $attrs.timeTracker.toString()

      isRaceSoon = =>
        (Date.now() - @details) <= 300000 # 5 mins

      updateTimestamp = =>
        $elem.addClass('highlighted') if isRaceSoon()
        (@details -= 1000); $timeout(updateTimestamp, 1000)

      updateTimestamp() if @details.match /^\d+$/

@PigeonFeet.directive 'timeTracker', ['$timeout', Blah]
