module Main exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Styles exposing (..)


main = 
    Browser.sandbox { init = init, update = update, view = view }

type alias Model = 
    { head : String
    , content : String
    }

init : Model
init =
    Model "Welcome to kino.ma" "Hello, this is kino.ma home page."

type alias Msg = ()

update : Msg -> Model -> Model
update _ model = model


view : Model -> Html Msg
view model =
    div baseStyle
        [ h1 headerStyle [ text model.head ]
        , div (mainStyle ++ [])
            [ p [] [ text model.content ]
            ]
        , div (mainStyle ++ [])
            [ a (subStyle ++ [ href "https://kino.ma"]) [ text "Twitter" ]
            , a (subStyle ++ [ href "https://mastodon.kino.ma" ]) [ text "Mastodon" ]
            , a (subStyle ++ [ href "https://github.com/kino-ma" ]) [ text "Github" ]
            ]
        , div (mainStyle ++ [])
            [ a [ href "https://github.com/kino-ma/elm-web" ] [ text "page source" ]
            ]
        ]
