<section class="content-header">
    <h1>
        <?=$title?>
    </h1>
    <br>
</section>

<div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-12">
        <div class="box box-primary box-solid">
            <div class="box-header with-border">
                <h3 class="box-title"><?=$title?></h3>

                <div class="box-tools pull-right">

                </div>
                <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?php
$errors = session()->getFlashdata('errors');
if (!empty($errors)) {?>
                <div class="alert alert-danger" role="alert">
                    <ul>
                        <?php foreach ($errors as $key => $value) {?>
                        <li><?=esc($value)?></li>
                        <?php }?>
                    </ul>
                </div>
                <?php }?>

                <?php
echo form_open_multipart('dsn/update/' . $dosen['id_dosen']);
?>


                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Kode Dosen</label>
                        <input name="kode_dosen" value="<?=$dosen['kode_dosen']?>" class="form-control"
                            placeholder="Kode Dosen">
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label>NIDN</label>
                        <input name="nidn" value="<?=$dosen['nidn']?>" class="form-control" placeholder="NIDN">
                    </div>
                </div>

                <div class="form-group col-sm-12">
                    <label>Nama Dosen</label>
                    <input name="nama_dosen" value="<?=$dosen['nama_dosen']?>" class="form-control"
                        placeholder="Nama Dosen">
                </div>
                <div class="form-group col-sm-12">
                    <label>Alamat</label>
                    <input name="alamat" value="<?=$dosen['alamat']?>" class="form-control" placeholder="Alamat">
                </div>

                <div class="form-group col-sm-6">
                    <label>Tempat Lahir</label>
                    <input name="tmp_lahir" value="<?=$dosen['tmp_lahir']?>" class="form-control"
                        placeholder="Tempat Lahir">
                </div>

                <div class="form-group col-sm-6">
                    <label>Tanggal Lahir</label>
                    <input name="tgl_lahir" value="<?=$dosen['tgl_lahir']?>" type="date" class="form-control"
                        placeholder="Tanggal Lahir">
                </div>
                <div class="form-group col-sm-12">
                    <label>Pendidikan Terakhir</label>
                    <input name="pend_terakhir" value="<?=$dosen['pend_terakhir']?>" class="form-control"
                        placeholder="Pendidikan Terakhir">
                </div>
                <div class="form-group col-sm-4">
                    <label>No HP</label>
                    <input name="no_hp" value="<?=$dosen['no_hp']?>" type="number" maxlength="13" class="form-control"
                        placeholder="No HP">
                </div>
                <div class="form-group col-sm-4">
                    <label>E-Mail</label>
                    <input name="email" value="<?=$dosen['email']?>" type="email" class="form-control"
                        placeholder="E-Mail">
                </div>
                <div class="form-group col-sm-4">
                    <label>Password</label>
                    <input name="password" value="<?=$dosen['password']?>" class="form-control" placeholder="Password">
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <img src="<?=base_url('fotodosen/default.png')?>" id="gambar_load" width="200px">
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Foto Dosen</label>
                        <input type="file" value="<?=$dosen['foto_dosen']?>" name="foto_dosen" id="preview_gambar"
                            class="form-control">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <a href="<?=base_url('dsn')?>" class="btn btn-danger pull-left btn-flat">Close</a>
                <button type="submit" class="btn btn-success btn-flat">Simpan</button>
            </div>
            <?php echo form_close() ?>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
    <div class="col-sm-3">
    </div>


</div>