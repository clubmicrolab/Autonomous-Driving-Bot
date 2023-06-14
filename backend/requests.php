<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';

$app = AppFactory::create();

$database = require __DIR__."settings.php";

$dbConnection = require __DIR__."dbConnection.php";

$pdo = $dbConnection.createConnection( $database["host"], $database["port"], $database["dbname"], $database["user"], $database["password"] )

//Insert a new route
$app->post('/routes', function (Request $request, Response $response) use ($pdo) {
    $data = $request->getParsedBody();

    $start = $data['start'];
    $finish = $data['finish'];

    $stmt = $pdo->prepare('INSERT INTO routes (start, finish) VALUES (?, ?)');
    $stmt->execute([$start, $finish]);

    $response->getBody()->write('Route created successfully');
    return $response->withStatus(201);
});

//Insert a subroute
$app->post('/subroutes', function (Request $request, Response $response) use ($pdo) {
    $data = $request->getParsedBody();

    $routeId = $data['route_id'];
    $direction = $data['direction'];
    $angle = $data['angle'];
    $distance = $data['distance'];
    $start = $data['start'];
    $finish = $data['finish'];

    $stmt = $pdo->prepare('INSERT INTO sub_routes (route_id, direction, angle, distance, start, finish) VALUES (?, ?, ?, ?, ?, ?)');
    $stmt->execute([$routeId, $direction, $angle, $distance, $start, $finish]);

    $response->getBody()->write('Subroute created successfully');
    return $response->withStatus(201);
});

// Get all subroutes for a route
$app->get('/routes/{routeId}/subroutes', function (Request $request, Response $response, array $args) use ($pdo) {
    $routeId = $args['routeId'];

    $stmt = $pdo->prepare('SELECT * FROM sub_routes WHERE route_id = ?');
    $stmt->execute([$routeId]);
    $subroutes = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $response->withJson($subroutes);
});

$app->run();
