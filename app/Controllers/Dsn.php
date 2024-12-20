<?php

namespace App\Controllers;

use App\Models\ModelDsn;
use App\Models\ModelTa;

class Dsn extends BaseController
{

    public function __construct()
    {
        $this->ModelDsn = new ModelDsn();
        $this->ModelTa = new ModelTa();
        helper('form');
    }

    public function index()
    {
        $data = [
            'title' => 'Dosen',
            'dosen' => $this->ModelDsn->DataDosen(),
            'ta' => $this->ModelTa->ta_aktif(),
            'isi' => 'v_dashboard_dsn',
        ];
        return view('layout/v_wrapper', $data);
    }
    public function edit($id_dosen)
    {
        $data = [
            'title' => 'Edit Data Dosen',
            'dosen' => $this->ModelDsn->detailData($id_dosen),
            'isi' => 'dosen/v_edit',
        ];
        return view('layout/v_wrapper', $data);
    }
    public function update($id_dosen)
    {
        if ($this->validate([
            'kode_dosen' => [
                'label' => 'Kode Dosen',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'nidn' => [
                'label' => 'NIDN',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'nama_dosen' => [
                'label' => 'Nama Dosen',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'tmp_lahir' => [
                'label' => 'Tempat Lahir',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'tgl_lahir' => [
                'label' => 'Tanggal Lahir',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'pend_terakhir' => [
                'label' => 'Pendidikan Terakhir',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'no_hp' => [
                'label' => 'No HP',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'email' => [
                'label' => 'E-Mail',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'password' => [
                'label' => 'Password',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Wajib Diisi !!!',
                ],
            ],
            'foto_dosen' => [
                'label' => 'Foto Dosen',
                'rules' => 'max_size[foto_dosen,1024]|mime_in[foto_dosen,image/png,image/jpeg,image/jpg,image/gif,image/ico]',
                'errors' => [
                    'max_size' => '{field} Max 1024 KB',
                    'mime_in' => 'Format {field} Wajib PNG, JPG, JPEG, GIF, ICO',
                ],
            ],
        ])) {
            //mengambil file foto dari form input
            $foto = $this->request->getFile('foto_dosen');

            if ($foto->getError() == 4) {
                //jika foto tidak diganti
                $data = array(
                    'id_dosen' => $id_dosen,
                    'kode_dosen' => $this->request->getPost('kode_dosen'),
                    'nidn' => $this->request->getPost('nidn'),
                    'nama_dosen' => $this->request->getPost('nama_dosen'),
                    'alamat' => $this->request->getPost('alamat'),
                    'tmp_lahir' => $this->request->getPost('tmp_lahir'),
                    'tgl_lahir' => $this->request->getPost('tgl_lahir'),
                    'pend_terakhir' => $this->request->getPost('pend_terakhir'),
                    'no_hp' => $this->request->getPost('no_hp'),
                    'email' => $this->request->getPost('email'),
                    'password' => $this->request->getPost('password'),
                );
                $this->ModelDsn->edit($data);
            } else {
                //menghapus foto lama
                $dosen = $this->ModelDsn->detailData($id_dosen);
                if ($dosen['foto_dosen'] != "") {
                    unlink('fotodosen/' . $dosen['foto_dosen']);
                }
                //merename nama file foto
                $nama_file = $foto->getRandomName();
                //jika valid
                $data = array(
                    'id_dosen' => $id_dosen,
                    'kode_dosen' => $this->request->getPost('kode_dosen'),
                    'nidn' => $this->request->getPost('nidn'),
                    'nama_dosen' => $this->request->getPost('nama_dosen'),
                    'alamat' => $this->request->getPost('nama_dosen'),
                    'tmp_lahir' => $this->request->getPost('tmp_lahir'),
                    'tgl_lahir' => $this->request->getPost('tgl_lahir'),
                    'pend_terakhir' => $this->request->getPost('pend_terakhir'),
                    'no_hp' => $this->request->getPost('no_hp'),
                    'email' => $this->request->getPost('email'),
                    'password' => $this->request->getPost('password'),
                    'foto_dosen' => $nama_file,
                );
                //memindahkan file foto dari form input ke folder foto di directory
                $foto->move('fotodosen', $nama_file);
                $this->ModelDsn->edit($data);
            }
            session()->setFlashdata('pesan', 'Data Berhasil Di Ganti !!');
            return redirect()->to(base_url('dsn'));
        } else {
            //jika tidak valid
            session()->setFlashdata('errors', \Config\Services::validation()->getErrors());
            return redirect()->to(base_url('dsn/edit/' . $id_dosen));
        }
    }

    public function jadwal()
    {
        $ta = $this->ModelTa->ta_aktif();
        $dosen = $this->ModelDsn->DataDosen();
        $data = [
            'title' => 'Jadwal Mengajar',
            'ta' => $ta,
            'jadwal' => $this->ModelDsn->JadwalDosen($dosen['id_dosen'], $ta['id_ta']),
            'isi' => 'dosen/v_jadwal',
        ];
        return view('layout/v_wrapper', $data);
    }

    public function AbsenKelas()
    {
        $ta = $this->ModelTa->ta_aktif();
        $dosen = $this->ModelDsn->DataDosen();
        $data = [
            'title' => 'Absen Kelas',
            'ta' => $ta,
            'absen' => $this->ModelDsn->JadwalDosen($dosen['id_dosen'], $ta['id_ta']),
            'isi' => 'dosen/absenkelas/v_absenkelas',
        ];
        return view('layout/v_wrapper', $data);
    }

    public function absensi($id_jadwal)
    {
        $ta = $this->ModelTa->ta_aktif();
        $data = [
            'title' => 'Absensi',
            'ta' => $ta,
            'jadwal' => $this->ModelDsn->DetailJadwal($id_jadwal),
            'mhs' => $this->ModelDsn->mhs($id_jadwal),
            'isi' => 'dosen/absenkelas/v_absensi',
        ];
        return view('layout/v_wrapper', $data);
    }

    public function SimpanAbsen($id_jadwal)
    {
        $mhs = $this->ModelDsn->mhs($id_jadwal);
        foreach ($mhs as $key => $value) {
            $data = [
                'id_krs' => $this->request->getPost($value['id_krs'] . 'id_krs'),
                'p1' => $this->request->getPost($value['id_krs'] . 'p1'),
                'p2' => $this->request->getPost($value['id_krs'] . 'p2'),
                'p3' => $this->request->getPost($value['id_krs'] . 'p3'),
                'p4' => $this->request->getPost($value['id_krs'] . 'p4'),
                'p5' => $this->request->getPost($value['id_krs'] . 'p5'),
                'p6' => $this->request->getPost($value['id_krs'] . 'p6'),
                'p7' => $this->request->getPost($value['id_krs'] . 'p7'),
                'p8' => $this->request->getPost($value['id_krs'] . 'p8'),
                'p9' => $this->request->getPost($value['id_krs'] . 'p9'),
                'p10' => $this->request->getPost($value['id_krs'] . 'p10'),
                'p11' => $this->request->getPost($value['id_krs'] . 'p11'),
                'p12' => $this->request->getPost($value['id_krs'] . 'p12'),
                'p13' => $this->request->getPost($value['id_krs'] . 'p13'),
                'p14' => $this->request->getPost($value['id_krs'] . 'p14'),
                'p15' => $this->request->getPost($value['id_krs'] . 'p15'),
                'p16' => $this->request->getPost($value['id_krs'] . 'p16'),
                'p17' => $this->request->getPost($value['id_krs'] . 'p17'),
                'p18' => $this->request->getPost($value['id_krs'] . 'p18'),
            ];
            $this->ModelDsn->SimpanAbsen($data);
        }
        session()->setFlashdata('pesan', 'Absensi Berhasil Di Update !!');
        return redirect()->to(base_url('dsn/absensi/' . $id_jadwal));
    }
    //--------------------------------------------------------------------

    public function print_absensi($id_jadwal)
    {
        $ta = $this->ModelTa->ta_aktif();
        $data = [
            'title' => 'Print Absensi',
            'ta' => $ta,
            'jadwal' => $this->ModelDsn->DetailJadwal($id_jadwal),
            'mhs' => $this->ModelDsn->mhs($id_jadwal),

        ];
        return view('dosen/absenkelas/v_print_absensi', $data);
    }

    public function NilaiMahasiswa()
    {
        $ta = $this->ModelTa->ta_aktif();
        $dosen = $this->ModelDsn->DataDosen();
        $data = [
            'title' => 'Nilai Mahasiswa',
            'ta' => $ta,
            'absen' => $this->ModelDsn->JadwalDosen($dosen['id_dosen'], $ta['id_ta']),
            'isi' => 'dosen/nilai/v_nilaimahasiswa',
        ];
        return view('layout/v_wrapper', $data);
    }

    public function DataNilai($id_jadwal)
    {
        $ta = $this->ModelTa->ta_aktif();
        $data = [
            'title' => 'Nilai',
            'ta' => $ta,
            'jadwal' => $this->ModelDsn->DetailJadwal($id_jadwal),
            'mhs' => $this->ModelDsn->mhs($id_jadwal),
            'isi' => 'dosen/nilai/v_datanilai',
        ];
        return view('layout/v_wrapper', $data);
    }

    public function SimpanNilai($id_jadwal)
    {
        $mhs = $this->ModelDsn->mhs($id_jadwal);
        foreach ($mhs as $key => $value) {
            $absen = $this->request->getPost($value['id_krs'] . 'absen');
            $tugas = $this->request->getPost($value['id_krs'] . 'nilai_tugas');
            $uts = $this->request->getPost($value['id_krs'] . 'nilai_uts');
            $uas = $this->request->getPost($value['id_krs'] . 'nilai_uas');
            $na = ($absen * 15 / 100) + ($tugas * 15 / 100) + ($uts * 30 / 100) + ($uas * 40 / 100);
            if ($na >= 85) {
                $nh = 'A';
                $bobot = 4;
            } elseif ($na < 85 && $na >= 75) {
                $nh = 'B';
                $bobot = 3;
            } elseif ($na < 75 && $na >= 65) {
                $nh = 'C';
                $bobot = 2;
            } elseif ($na < 65 && $na >= 55) {
                $nh = 'D';
                $bobot = 1;
            } else {
                $nh = 'E';
                $bobot = 0;
            }
            $data = [
                'id_krs' => $this->request->getPost($value['id_krs'] . 'id_krs'),
                'nilai_tugas' => $this->request->getPost($value['id_krs'] . 'nilai_tugas'),
                'nilai_uts' => $this->request->getPost($value['id_krs'] . 'nilai_uts'),
                'nilai_uas' => $this->request->getPost($value['id_krs'] . 'nilai_uas'),
                'nilai_akhir' => number_format($na, 0),
                'nilai_huruf' => $nh,
                'bobot' => $bobot,
            ];
            $this->ModelDsn->SimpanNilai($data);
        }
        session()->setFlashdata('pesan', 'Nilai Berhasil Di Update !!');
        return redirect()->to(base_url('dsn/DataNilai/' . $id_jadwal));
    }

    public function PrintNilai($id_jadwal)
    {
        $ta = $this->ModelTa->ta_aktif();
        $data = [
            'title' => 'Rekap Nilai Mahasiswa',
            'ta' => $ta,
            'jadwal' => $this->ModelDsn->DetailJadwal($id_jadwal),
            'mhs' => $this->ModelDsn->mhs($id_jadwal),

        ];
        return view('dosen/nilai/v_printnilai', $data);
    }
}