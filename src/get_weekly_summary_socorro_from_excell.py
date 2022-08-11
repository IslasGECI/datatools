import typer
import os

app = typer.Typer(help="Awesome CLI user manager.")

WEEK = 1

EXCELL_PATH = "datos/junio.xlsx"


@app.command()
def weeks_to_csv(
    week: int = typer.Argument(WEEK, help="Week number in the sheet"),
    excell_path: str = typer.Argument(EXCELL_PATH, help="xlsx file path"),
):
    os.system(f"./src/get_weekly_summary_socorro_from_excell.sh {week} {excell_path}")


if __name__ == "__main__":
    app()
