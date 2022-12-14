<?php
include_once "../php/conexion.php";
include_once "../includes/encabezado.php";
?>
<section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white  shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">Sign up</h2>
              <p class="text-white-50 mb-5">Please enter your username and password!</p>

              <div class="form-outline form-white mb-4">
                <input type="username" name="username" id="username" class="form-control form-control-lg" />
                <label class="form-label" for="username">Username</label>
              </div>

              <div class="form-outline form-white mb-4">
                <input type="password" name="contrasena2" id="contrasena2" class="form-control form-control-lg" />
                <label class="form-label" for="contrasena2">Password</label>
              </div>

              
              <div class="form-outline form-white mb-4">
                <input type="password" name="contrasena" id="contrasena" class="form-control form-control-lg" />
                <label class="form-label" for="contrasena">Verify your password</label>
              </div>

              <button class="btn btn-outline-light btn-lg px-5" type="submit">Sign up</button>

            </div>

            <div>
              <p class="mb-0">Do you have an account? <a href="login.php" class="text-white-50 fw-bold">Login</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>