<?php

namespace Vironeer\Addons\App\Http\Controllers\Frontend\Storage;

use App\Http\Controllers\Controller;
use Cache;
use Exception;
use Storage;

class CloudflareR2Controller extends Controller
{
    public static function setCredentials($data)
    {
        setEnv('CR2_ACCESS_KEY_ID', $data->credentials->access_key_id);
        setEnv('CR2_SECRET_ACCESS_KEY', $data->credentials->secret_access_key);
        setEnv('CR2_BUCKET', $data->credentials->bucket);
        setEnv('CR2_ENDPOINT', $data->credentials->endpoint);
    }

    public static function upload($file, $location)
    {
        try {
            $filename = generateFileName($file);
            $path = $location . $filename;
            $disk = Storage::disk('cloudflare');
            $uploadToStorage = $disk->put($path, fopen($file, 'r+'));
            if ($uploadToStorage) {
                $data = [
                    "type" => "success",
                    "filename" => $filename,
                    "path" => $path,
                    "link" => $disk->url($path),
                ];
                return responseHandler($data);
            }
        } catch (Exception $e) {
            return responseHandler(["type" => "error", 'msg' => lang('Storage provider error', 'upload zone')]);
        }
    }

    public static function getFile($fileEntry)
    {
        try {
            $cachePrefex = 'secure_' . hashid($fileEntry->id);
            if (Cache::has($cachePrefex)) {
                return Cache::get($cachePrefex);
            } else {
                $file = Storage::disk('cloudflare')->get($fileEntry->path);
                $response = \Response::make($file, 200);
                $response->header("Content-Type", $fileEntry->mime);
                Cache::put($cachePrefex, $response);
                return $response;
            }
        } catch (Exception $e) {
            return brokenFile();
        }
    }

    public static function download($fileEntry)
    {
        try {
            $disk = Storage::disk('cloudflare');
            $filePath = $disk->path($fileEntry->path);
            if ($disk->has($filePath)) {
                return $disk->temporaryUrl($filePath, now()->addHour(), [
                    'ResponseContentDisposition' => 'attachment; filename="' . $fileEntry->name . '"',
                ]);
            } else {
                throw new Exception(lang('There was a problem while trying to download the file', 'download page'));
            }
        } catch (Exception $e) {
            throw new Exception(lang('There was a problem while trying to download the file', 'download page'));
        }
    }

    public static function delete($filePath)
    {
        $disk = Storage::disk('cloudflare');
        if ($disk->has($filePath)) {
            $disk->delete($filePath);
        }
        return true;
    }
}
