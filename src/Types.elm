module Types exposing (Flags, Model, Msg(..), WebsiteHelper(..), WebsiteHelperProps)

import Html as H exposing (Html)
import Http


type Msg
    = Next
    | Loaded (Result Http.Error String)


type alias Flags =
    ()


type alias Model =
    { reddit : String
    , matches : List ( String, WebsiteHelper )
    , nextId : Int
    }


type WebsiteHelper
    = Gfycat


type alias WebsiteHelperProps =
    { matchers : List (String -> Bool)
    , render : String -> Html Msg
    }
