describe 'PigeonFeet', ->

  scope = $elem = $timeout = null
  beforeEach module 'PigeonFeet'
  beforeEach inject ($rootScope, $compile, _$timeout_) ->

    scope = $rootScope
    $timeout = _$timeout_
    $elem = angular.element '''
      <any time-tracker="4321">{{ time_tracker_output }}</any>
    '''
    $compile($elem)(scope)
    scope.$digest()


  it 'outputs the value provided to time-tracker attribute', ->
    expect( $elem.html() ).toMatch /4321/


  xit 'decrements the initial value by 1000 per second', ->
    pending = "Can't figure out to simulate ticking"
    $timeout.flush()
    scope.$digest()
    expect( $elem.html() ).toMatch /3321/


  it "doesn't error when fed non timestamp", inject ($rootScope, $compile) ->
    scope = $rootScope
    $elem = angular.element '''
      <any time-tracker="1,2,3,4">{{ time_tracker_output }}</any>
    '''
    $compile($elem)(scope)
    scope.$digest()
    expect( $elem.html() ).toMatch /1,2,3,4/
  

  it "doesn't error when fed null", inject ($rootScope, $compile) ->
    scope = $rootScope
    $elem = angular.element '''
      <any time-tracker="undefined">{{ time_tracker_output }}</any>
    '''
    $compile($elem)(scope)
    scope.$digest()
    expect( $elem.html() ).toMatch //


  it 'adds highlight class when < 5mins', inject ($rootScope, $compile) ->
    scope = $rootScope
    $elem = angular.element '''
      <any time-tracker="4321">{{ time_tracker_output }}</any>
    '''
    
    spyOn($elem, 'addClass').andReturn null
    $compile($elem)(scope)
    scope.$digest()
    console.log($elem.class)
    expect( $elem.addClass ).toHaveBeenCalled()
