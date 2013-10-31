Blah = ($timeout) ->

  scope: {}

  compile: ->
    ($scope, $elem, $attrs) ->
      @details = $scope.time_tracker_output = $attrs.timeTracker.toString()

      thing = =>
        $scope.time_tracker_output - Date.now()

      isRacePast = =>
        thing() < 0

      isRaceSoon = =>
        thing() <= 300000

      updateTimestamp = =>
        $elem.addClass 'highlighted' if isRaceSoon()
        $elem.removeClass 'highlighted' if isRacePast()
        (@details -= 1000); $timeout(updateTimestamp, 1000)

      updateTimestamp() if @details.match /^\d+$/

@PigeonFeet.directive 'timeTracker', ['$timeout', Blah]
