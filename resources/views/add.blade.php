<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-COMPATIBLE" content="ie=edge">
        <title>Product List</title>
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

</head>
<body>
    <div class="container" style="margin-top:20px ;">
        <div class="row">
            <div class="col-md-12">
                <h2>Product Add More </h2>
                @if (Session::has('success'))
                <div class="alert alert-success" role="alert">
                    {{Session::get('success')}}
                </div>
                    
                @endif
            
        <form action="{{url('save')}}" methods="GET">
            @csrf
            <div class="md-3">
                <label for="id" class="form-label">Book ID</label>
                <input type="text" name="bookID" class="form-control"
                            placeholder="Enter book ID">
            </div>  

            <div class="md-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" name="name" class="form-control"
                            placeholder="Enter book name">
            </div>   

            <div class="md-3">
                <label for="price" class="form-label">Price</label>
                <input type="text" name="price" class="form-control"
                            placeholder="Enter product price">
            </div>   

            <div class="md-3">
                <label for="details" class="form-label">Details</label>
                <input type="text" name="details" class="form-control"
                            placeholder="Enter product details">
            </div>

            <div class="md-3">
                <label for="image1" class="form-label">Image</label>
                <input type="file" name="image1" class="form-control"
                            placeholder="Enter product image">
            </div>  

            <div class="md-3">
                <label for="author" class="form-label">Author</label>
                <input type="text" name="author" class="form-control"
                            placeholder="Enter Author ID">
            </div>    

            <div class="md-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" name="category" class="form-control"
                            placeholder="Enter Category ID">
            </div> 

            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="{{url('admin-product')}}" class="btn btn-success">Back</a>
        </form>
            </div>
        </div>
    </div>
</body>
<html>