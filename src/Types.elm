module Types exposing (Flags, Model, Msg(..), WebsiteHelper(..), WebsiteHelperProps)

import Html as H exposing (Html)


type Msg
    = Void


type alias Flags =
    ()


type alias Model =
    { urls : List String
    , matches : List ( String, WebsiteHelper )
    }


type WebsiteHelper
    = Gfycat


type alias WebsiteHelperProps =
    { matchers : List (String -> Bool)
    , render : String -> Html Msg
    }
