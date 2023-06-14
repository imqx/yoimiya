using Oxygen: queryparams
using HTTP: Request
using JSON: json

function disp(req::Request)
    html = "<h1>Home</h1><br />"
    html *= "<h2>Headers: $(json(req.headers))</h2>"
    html *= "<h2>Body: $(json(req.body))</h2>"
    html *= "<h2>Method: $(json(req.method))</h2>"
    html *= "<h2>Target: $(json(req.target))</h2>"
    html *= "<h2>Context: $(json(req.context))</h2>"
    html *= "<h2>Url: $(json(req.url))</h2>"
    html *= "<h2>Params: $(queryparams(req))</h2>"
    return html
end
