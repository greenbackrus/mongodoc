(->
  # controller definition 
  PapersCtrl = (Restangular, $state) ->
    restPapers = Restangular.all('papers')
    @papers = restPapers.getList().$object
    share = this
    @editPaper = (paper) ->
      $state.go('paper.editPaper')
      share.activePaper = paper
    @addPaper = ->
      restPapers.post(@newPaper).then($state.reload())
    @patchPaper = (paper) ->
      paper.save().then($state.reload())
    @delPaper = (paper) ->
      paper.remove().then($state.reload())
    @showInfo = (paper) ->
      $state.go('paper.paperInfo')
      share.activePerson = person
    return
  # dependencies inject
  PapersCtrl.$inject = ['Restangular', '$state']
 
  angular.module('mongodoc')
  .controller('PapersCtrl', PapersCtrl)
)()