describe 'PigeonFeet', ->

  # NB: karma seems to be using a timezone
  #     other than Sydney's?

  hours = (diff) -> Date.now() + diff * 3600000

  distance_in_time = null

  beforeEach module 'PigeonFeet'
  beforeEach inject ($filter) ->
    distance_in_time = $filter('distance_in_time')

  describe 'formatting the input', ->

    it 'works with past events (hours and mins)', ->
      expect( distance_in_time(hours(-10.5)) ).toBe '10h30m ago'


    it 'works with past events (mins only)', ->
      # FIXME.
      expect( distance_in_time(hours(-0.5)) ).toBe '30m ago'


    it 'works with hours and mins remaining', ->
      expect( distance_in_time(hours(4.55)) ).toEqual '4h33m'


    it 'works with mins only', ->
      expect( distance_in_time(hours(0.55)) ).toEqual '33m'


    it 'works when < 10 mins', ->
      expect( distance_in_time(hours(0.05)) ).toEqual '3m'


    it 'initiates the countdown when < 1 min', ->
      expect( distance_in_time(hours(0.01)) ).toEqual '36s'


    it 'uses angular date $filter when event is next day', ->
      expect( distance_in_time(hours(25)) ).toMatch /\d:\d+\s.{2}/


  describe '', ->

    it 'passed non-timstamps', ->
      expect( distance_in_time(input = 'Evil String or watevz') ).toBe input


    it 'when passed null values', ->
      expect( distance_in_time(null) ).toBeFalsy()


    it 'when match on /\d+ but not timestamp', ->
      expect( distance_in_time(1) ).toEqual 1


