let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

let Delete = ./events/Delete.dhall

let Release = ./events/Release.dhall

in  { push : Optional Push
    , pull_request : Optional PullRequest
    , delete : Optional Delete
    , release : Optional Release
    }
