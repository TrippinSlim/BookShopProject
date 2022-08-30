<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Edit</title>
  </head>
  <body>
    <div class="container" style="margin-top:20px">
        <div class="row">
            <div class="col-md-12">
                <h2>Edit Author Name</h2>
                @if (Session::has('success'))
                    <div class="alert alert-success" role="alert">
                        {{Session::get('success')}}
                    </div>
                @endif
                <form action="{{url('update')}}" method="POST">
                    @csrf
                    <div class="md-3">
                        <label for="id" class="form-label">Author ID</label>
                        <input type="text" name="bookauthorID" class="form-control"
                                    value="{{$data->bookauthorID}}" readonly>
                    </div>
                    <div class="md-3">    
                    <label for="bookauthor" class="form-label">Author Name</label>
                    <input type="text" name="bookauthorname" class="form-control"
                                value="{{$data->bookauthorname}}">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="{{url('admin-author')}}" class="btn btn-success">Back</a>
                </form>
            </div>
        </div>
    </div>
  </body>
</html> 