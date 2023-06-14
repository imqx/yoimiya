using Oxygen: router, @get
using HTTP: Request

include("utils/Utils.jl")
using .Utils: disp

include("ctrls/Controllers.jl")
using .Controllers: home_controller


@get "/" home_controller

sample = router("/sample", tags=["Sample"])
@get sample("/hello") disp

