import subprocess
def test_group_traps_by_zone():
    set_group_traps_by_zone()
    file_new = "./IG_POSICION_TRAMPAS_10MAY2020_zona01.csv"
    file_test = "./tests/data_tests/IG_POSICION_TRAMPAS_10MAY2020_zona01.csv"
    assert_equal_file(file_new, file_test)

def set_group_traps_by_zone():
    bash_command = f"distinct_position_traps ./tests/data_tests/IG_POSICION_TRAMPAS_10MAY2020.csv"
    subprocess.getoutput(bash_command)

def assert_equal_file(file_new, file_test):
    bash_command = f"diff {file_new} {file_test} | wc --lines"
    output = int(subprocess.getoutput(bash_command))
    assert output == 0