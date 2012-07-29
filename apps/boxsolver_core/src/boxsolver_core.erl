%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc boxsolver_web startup code

-module(boxsolver_core).
-author('Andrew Grosser <dioptre@gmail.com>').
-export([start/0, start_link/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

%% @spec start_link() -> {ok,Pid::pid()}
%% @doc Starts the app for inclusion in a supervisor tree
start_link() ->
    ensure_started(crypto),
    boxsolver_core_sup:start_link().

%% @spec start() -> ok
%% @doc Start the boxsolver_web server.
start() ->
    ensure_started(crypto),
    application:start(boxsolver_core).

%% @spec stop() -> ok
%% @doc Stop the boxsolver_web server.
stop() ->
    Res = application:stop(boxsolver_core),
    application:stop(crypto),
    Res.
