import { render, screen, fireEvent } from '@testing-library/react';
import Profile from "../index"

describe("Profile", () => {
    it('should render followers', () => {
        render(<Profile />);
        const followersButton = screen.getByTestId('followers-button');
        fireEvent.click(followersButton);
        const followersSection = screen.getAllByTestId('followers-section');
        expect(followersSection[0]).toBeInTheDocument();
    });
})