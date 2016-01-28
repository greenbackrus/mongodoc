(->
  # configurations defenition
#  authConfig = ($authProvider) ->
#    $authProvider.configure({apiUrl: 'http://localhost:3000'})
  restConfig = (RestangularProvider) ->
    RestangularProvider
    .setRequestSuffix('.json')
    .setRestangularFields({id: '_id.$oid'});
  statesConfig = ($stateProvider, $urlRouterProvider, $locationProvider) -> 
    $stateProvider
    #people
    .state('people', { url: '/people', abstract: true, templateUrl: 'people/index.html'})
    .state('people.list', { url: '', views: {
      'leftColon':  {templateUrl: 'people/list.html'}
      'rightColon': {templateUrl: 'people/welcome.html'}
    }})
    .state('people.personInfo', { url: 'people/:id', views: {
      'leftColon':  {templateUrl: 'people/list.html'}
      'rightColon': {templateUrl: 'people/show.html'}
      }})
    .state('people.addPerson', { url: '/new', views: {
      'leftColon':  {templateUrl: 'people/list.html'}
      'rightColon': {templateUrl: 'people/create.html'}
      }})    
    .state('people.editPerson', { url: '/:id/edit', views: {
      'leftColon':  {templateUrl: 'people/list.html'}
      'rightColon': {templateUrl: 'people/edit.html'}
      }})
    #papers
    .state('papers', { url: '/papers', abstract: true, templateUrl: 'papers/index.html'})
    .state('papers.list', { url: '', views: {
      'leftColon':  {templateUrl: 'papers/list.html'}
      'rightColon': {templateUrl: 'papers/welcome.html'}
    }})
    .state('papers.paperInfo', { url: 'paper/:id', views: {
      'leftColon':  {templateUrl: 'papers/list.html'}
      'rightColon': {templateUrl: 'papers/show.html'}
      }})
    .state('papers.addPaper', { url: '/new', views: {
      'leftColon':  {templateUrl: 'papers/list.html'}
      'rightColon': {templateUrl: 'papers/create.html'}
      }})    
    .state('papers.editPaper', { url: '/:id/edit', views: {
      'leftColon':  {templateUrl: 'papers/list.html'}
      'rightColon': {templateUrl: 'papers/edit.html'}
      }})    
#    .state('people',            {url: '/people',        templateUrl: 'people/index.html',     controller: "PeopleCtrl as peopleCtrl"})
#    .state('admin',             {url: '/admin',         templateUrl: 'admin.html', abstract: true})
#    .state('admin.items',       {url: '/items',         templateUrl: 'adminPatterns/items.html'})
#    .state('admin.prices',      {url: '/prices',        templateUrl: 'adminPatterns/prices.html'})
    $urlRouterProvider.otherwise('/')
  # dependencies inject
#  authConfig.$inject    =  ['$authProvider']
  restConfig.$inject    =  ['RestangularProvider']
  statesConfig.$inject  =  ['$stateProvider', '$urlRouterProvider', '$locationProvider']

  angular.module('mongodoc')
#  .config(authConfig)
  .config(restConfig)
  .config(statesConfig)
)()