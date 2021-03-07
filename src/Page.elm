module Page exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (style, src)
import Browser exposing (Document)

import Css exposing (..)
import Session exposing (..)
import Route exposing (..)
import Html.Events exposing (onClick)


type Page
    = Home
    | AddContent
    | Other


view : Page -> { title : String, content : Html msg } -> Document msg
view page { title, content } =
    { title = title
    , body = [ viewHeader, content, viewFooter ]
    }

viewHeader : Html msg
viewHeader =
    header
        [ class Style "page-header-container" ]
        [ logo
        , headerMenuLink [] None [ text "MENU " ]
        , hiddenMenu [] True
        ]


headerMenuLink : List (Attribute msg) -> Route -> List (Html msg) -> Html msg
headerMenuLink attrs route =
    a <| attrs ++ [ class Style "page-header-child", href route ]


logo : Html msg
logo = 
    headerMenuLink
        [ class Style "page-header-logo-container" ]
        Route.Home
        [ img [ src "/favicon.ico", class Style "page-header-logo" ] [] ]




hiddenMenu : List (Attribute msg) -> Bool -> Html msg
hiddenMenu atrs show = 
    div
        (atrs ++ [ class Style "hidden-menu", style "display" (if show then "block" else "none") ])
        [ headerMenuLink [] Route.AddContent [text "add_content"]
        ]


viewFooter : Html msg
viewFooter = 
    footer
        [ class Style "page-footer-container" ]
        [ small [] [ text "footer" ] ]