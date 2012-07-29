%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Callbacks for the boxsolver_web application.

-module(boxsolver_web_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for boxsolver_web.
start(_Type, _StartArgs) ->
    boxsolver_web_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for boxsolver_web.
stop(_State) ->
    ok.
