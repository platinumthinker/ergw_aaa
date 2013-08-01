%% Copyright 2010-2012, Travelping GmbH <info@travelping.com>

-module(ctld_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    eradius_dict:load_tables([dictionary,
			      dictionary_tunnel,
			      dictionary_rfc4679,
			      dictionary_alcatel_sr,
			      dictionary_travelping]),
    ctld_session_sup:start_link().

stop(_State) ->
    ok.