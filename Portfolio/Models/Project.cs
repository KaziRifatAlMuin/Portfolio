using System;
using System.ComponentModel.DataAnnotations;

namespace Portfolio.Models
{
    public class Project
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Title is required")]
        [StringLength(200, ErrorMessage = "Title cannot exceed 200 characters")]
        public string Title { get; set; }

        [Required(ErrorMessage = "Image URL is required")]
        [StringLength(200, ErrorMessage = "Image URL cannot exceed 200 characters")]
        public string ImageURL { get; set; }

        [Required(ErrorMessage = "Description is required")]
        [StringLength(1000, ErrorMessage = "Description cannot exceed 1000 characters")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Tags are required")]
        [StringLength(500, ErrorMessage = "Tags cannot exceed 500 characters")]
        public string Tags { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}