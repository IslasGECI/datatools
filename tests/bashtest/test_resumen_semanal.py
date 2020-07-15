import subprocess


def test_resumen_semanal():
    assert_weekly_summary("./tests/data_tests/esfuerzo_data_tests.csv")


def assert_weekly_summary(file_input):
    bash_command = f"cp {file_input} . && resumen_semanal > ./salida.tmp"
    subprocess.getoutput(bash_command)
    output = have_same_content("./salida.tmp")
    assert output == 0


def have_same_content(file_new):
    bash_command = f"diff {file_new} ./tests/data_tests/output_resumen_semanal.txt | wc --lines"
    subprocess.getoutput(bash_command)
    return int(subprocess.getoutput(bash_command))
