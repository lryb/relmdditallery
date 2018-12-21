module Types exposing (Flags, Model, Msg(..), WebsiteHelper(..), WebsiteHelperProps)

import Html as H exposing (Html)


type Msg
    = Next


type alias Flags =
    ()


type alias Model =
    { reddit : String
    , urls : List String
    , matches : List ( String, WebsiteHelper )
    , nextId : Int
    }


type WebsiteHelper
    = Gfycat


type alias WebsiteHelperProps =
    { matchers : List (String -> Bool)
    , render : String -> Html Msg
    }
