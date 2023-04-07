import { render, screen } from "@testing-library/react";
import Home from "../pages/home";
import "@testing-library/jest-dom";
import { BrowserRouter } from "react-router-dom";

describe("Home", () => {
  it("should render correctly", () => {
    render(

        <Home />

    );
    expect(screen.getByText("Página Inicial")).toBeInTheDocument();
  });
});
