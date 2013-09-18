DistanceInTime = ($filter) ->

  percentToMins = (input) ->
    Math.floor 60.0 * parseFloat('0.' + input)

  immediateOrPastEvent = =>
    @hours_untill_now <= 0.016665

  isNextDayEvent = =>
    @memos[0] >= 24

  isPastEvent = =>
    @hours_untill_now < 0

  formatPastEvent = =>
    "#{hoursMinsSecs()} ago"

  formatImmediateEvent = =>
    "#{Math.floor(60 * (60 * @hours_untill_now))}s"
    
  deterineEventStatus = =>
    `isPastEvent() ? formatPastEvent() : formatImmediateEvent()`

  delegateToAngularFilter = =>
    $filter('date')(@timestamp, 'shortTime')

  hoursMinsSecs = =>
    "#{@memos[0]}h#{percentToMins(@memos[1])}m".replace(/-/, '').replace(/^(0|-)./, '')

  formatAsDistanceInTime = =>
    `isNextDayEvent() ? delegateToAngularFilter() : hoursMinsSecs()`

  validTimestamp = =>
    @timestamp?.toString().match(/^\d{13}$/)

  validateAndMemoizeTimestamp = =>
    memoize hoursUntillNow() if validTimestamp()

  memoize = (timestamp) =>
    @memos = "#{timestamp}".split('.')

  hoursUntillNow = =>
    (@hours_untill_now = (@timestamp - Date.now()) / 60 / 60 / 1000)

  (@timestamp) =>
    return @timestamp unless validateAndMemoizeTimestamp()
    `immediateOrPastEvent() ? deterineEventStatus() : formatAsDistanceInTime()`

@PigeonFeet.filter 'distance_in_time', [
  '$filter'
  DistanceInTime
]
