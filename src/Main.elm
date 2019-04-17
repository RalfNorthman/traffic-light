module Main exposing (main)

import Browser
import Browser.Events
import Color
import Element exposing (Element)
import Element.Background as Background
import Html exposing (Html)
import Html.Attributes exposing (id)
import TypedSvg exposing (circle, defs, pattern, rect, svg)
import TypedSvg.Attributes exposing (..)
import TypedSvg.Types exposing (..)



---- Model ----


type alias Model =
    { one : Float
    , two : Float
    , seconds : Float
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { one = 20
      , two = 20
      , seconds = 0
      }
    , Cmd.none
    )


type Msg
    = AnimationDelta Float



---- Update ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AnimationDelta delta ->
            ( animationUpdate model delta, Cmd.none )


animationUpdate : Model -> Float -> Model
animationUpdate model delta =
    let
        second =
            delta / 1000

        time =
            model.seconds + second
    in
    { model
        | one = 18 + 2 * cos (11 / 3 * time)
        , two = 18 + 2 * cos (7 / 3 * time)
        , seconds = time
    }



---- View ----


trafficLight : Model -> Element msg
trafficLight model =
    Element.html <|
        svg
            [ width <| percent 100
            , height <| px 500
            ]
            [ defs
                []
                [ pattern
                    [ id "pattern"
                    , x (px model.two)
                    , y (px model.one)
                    , height (px 20)
                    , width (px 20)
                    , patternUnits CoordinateSystemUserSpaceOnUse
                    ]
                    [ circle
                        [ cx (px model.one)
                        , cy (px model.two)
                        , r (px 15)
                        , fill <| Fill <| Color.rgb 0 0 0.2
                        , strokeWidth (px <| 3 + model.two / 3 - model.one / 5)
                        , stroke <| Color.rgba 0.7 0.2 0.3 0.3
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


view : Model -> Html msg
view model =
    Element.layout
        [ Background.color <| Element.rgb 0 0 0 ]
    <|
        trafficLight model



---- Subscriptions ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onAnimationFrameDelta AnimationDelta



---- Main ----


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
