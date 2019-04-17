module Main exposing (main)

import Browser
import Browser.Events
import Color
import Html exposing (Html)
import Html.Attributes exposing (id)
import TypedSvg exposing (circle, defs, pattern, rect, svg)
import TypedSvg.Attributes exposing (..)
import TypedSvg.Types exposing (..)



---- Model ----


type alias Model =
    { patternCircleCX : Float
    , patternCircleCY : Float
    , seconds : Float
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { patternCircleCX = 20
      , patternCircleCY = 20
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
        | patternCircleCX = 20 + 5 * cos (11 / 3 * time)
        , patternCircleCY = 20 + 7 * cos (7 / 3 * time)
        , seconds = time
    }



---- View ----


view : Model -> Html msg
view model =
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
                    [ cx (px model.patternCircleCX)
                    , cy (px model.patternCircleCY)
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
