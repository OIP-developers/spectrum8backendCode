<?php

namespace App\Exceptions;

use Throwable;
use Illuminate\Session\TokenMismatchException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\HttpExceptionInterface;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        //
    }
    // protected function shouldReturnJson($request, Throwable $e)
    // {
    //     return true;
    // }
    public function render($request, Throwable $exception)
    {
        if (!$request->is('api/*') && $exception instanceof TokenMismatchException) {
            return redirect()->route('login');
        }
        if ($request->is('api/*')  && $exception instanceof HttpExceptionInterface) {
            $code = $exception->getStatusCode();
            if ($code == 404) {
                return response()->json([
                    'message' => '404 not Found'
                ], 404);
            }
        }
        if ($request->is('api/*') && $exception) {
            return response()->json([
                'message' => $exception->getMessage()
            ], 401);
        }
        return parent::render($request, $exception);
    }
}
