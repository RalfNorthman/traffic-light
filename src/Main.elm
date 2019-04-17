module Main exposing (main)

import Browser.Events
import Color
import Html exposing (Html)
import Html.Attributes exposing (id)
import TypedSvg exposing (circle, defs, pattern, rect, svg)
import TypedSvg.Attributes exposing (..)
import TypedSvg.Types exposing (..)



---- Model ----


type alias Model =
    { something : Int }


init : flags -> ( Model, Cmd Msg )
init _ =
    ( { something = 0 }, Cmd.none )


type Msg
    = NoOp



---- Update ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



---- View ----


view : Html msg
view =
    svg
        [ width <| percent 100, height <| px 500 ]
        [ defs
            []
            [ pattern
                [ id "pattern"
                , x (px 20)
                , y (px 20)
                , height (px 20)
                , width (px 20)
                , patternUnits CoordinateSystemUserSpaceOnUse
                ]
                [ circle
                    [ cx (px 20)
                    , cy (px 20)
                    , r (px 18)
                    , fill <| Fill Color.charcoal
                    , strokeWidth (px 8)
                    , stroke <| Color.rgba 0.8 0.1 0.5 0.5
                    ]
                    []
                ]
            ]
        , circle
            [ style "fill: url(#pattern)"
            , cx (px 220)
            , cy (px 220)
            , r (px 200)
            ]
            []
        ]



---- Subscriptions ----


main : Program flags Model Msg
main =
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
