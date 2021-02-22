module AddContent exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (value, type_, placeholder)
import Html.Events exposing (onInput, onClick)
import Css exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }

type alias Model = 
    { content : String
    , sub : String
    , result : String
    }

init : Model
init =
    Model "" "" "add string to the start or the end of content"

type Msg
    = UpdateContent String
    | UpdateSub String
    | Front
    | Lear
    | Both
    | Reset

update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateContent str ->
            { model | content = str, result = str }
        UpdateSub str ->
            { model | sub = str }
        Front ->
            { model | result = model.sub ++ model.result }
        Lear ->
            { model | result = model.result ++ model.sub }
        Both ->
            update Front (update Lear model)
        Reset ->
            { model | result = model.content }


view : Model -> Html Msg
view model =
    div []
        [ h1 [class Style "header" ] [ text model.result ]
        , div [class Style "container"]
            [ input [ type_ "text", placeholder "main content", value model.content, onInput UpdateContent ] []
            , input [ type_ "text", placeholder "add string",   value model.sub,     onInput UpdateSub     ] []
            ]
        , div [class Style "content"]
            [ button [ onClick Front ] [ text "add to head" ]
            , button [ onClick Lear ] [ text "add to tail" ]
            , button [ onClick Both ] [ text "both!"  ]
            ]
        , div [class Style "content"]
            [ button [ onClick Reset ] [ text "reset result content" ]
            ]
        ]
