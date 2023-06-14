using HTTP: Request, Response, method, headercontains
using JSON: json
using Oxygen: html

const CORS_HEADERS = [
    "Access-Control-Allow-Origin" => "*",
    "Access-Control-Allow-Headers" => "*",
    "Access-Control-Allow-Methods" => "POST, GET, OPTIONS"
]

# 跨域请求中间件
function cors_middleware(handler)
    return function (req::Request)
        @info "cors?"
        if method(req) == "OPTIONS"
            return Response(200, CORS_HEADERS)
        else
            return handler(req) # passes the request to the auth_middleware
        end
    end
end

# 
function session_middleware(handler)
    return function (req::Request)
        # ** NOT an actual security check ** #
        if startswith(req.target, "/static")
            return handler(req)
        elseif !headercontains(req, "Authorization", "true")
            @info "anonymous access..."
            return handler(req)
        else
            return handler(req) # passes the request to your application
        end
    end
end
