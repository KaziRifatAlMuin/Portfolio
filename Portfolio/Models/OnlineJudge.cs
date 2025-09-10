using System;
using System.ComponentModel.DataAnnotations;

namespace Portfolio.Models
{
    public class OnlineJudge
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Name is required")]
        [StringLength(100, ErrorMessage = "Name cannot exceed 100 characters")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Solve Count is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Solve Count must be a positive number")]
        public int SolveCount { get; set; }

        [Required(ErrorMessage = "Profile URL is required")]
        [StringLength(500, ErrorMessage = "Profile URL cannot exceed 500 characters")]
        public string ProfileURL { get; set; }

        [Required(ErrorMessage = "Image URL is required")]
        [StringLength(200, ErrorMessage = "Image URL cannot exceed 200 characters")]
        public string ImageURL { get; set; }

        [StringLength(200, ErrorMessage = "Display Text cannot exceed 200 characters")]
        public string DisplayText { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}