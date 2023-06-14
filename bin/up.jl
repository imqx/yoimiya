using Oxygen: serve, dynamicfiles, staticfiles, @get, html

include("../config/site.jl")
include("../src/routes.jl")

staticfiles("static", "static")

include("../src/mdwrs/Middlewares.jl")
using .Middlewares: cors_middleware, session_middleware

serve(
    port=port,
    middleware=[cors_middleware, session_middleware]
)
